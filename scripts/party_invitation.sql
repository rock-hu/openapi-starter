--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: party_invitation; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_invitation (
    party_invitation_id character varying(20) NOT NULL,
    party_id_from character varying(20),
    party_id character varying(20),
    to_name character varying(100),
    email_address character varying(255),
    status_id character varying(20),
    last_invite_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_invitation OWNER TO ofbiz;

--
-- Name: party_invitation pk_party_invitation; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_invitation
    ADD CONSTRAINT pk_party_invitation PRIMARY KEY (party_invitation_id);


--
-- Name: prt_invttn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_invttn_txcrts ON party_invitation USING btree (created_tx_stamp);


--
-- Name: prt_invttn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_invttn_txstmp ON party_invitation USING btree (last_updated_tx_stamp);


--
-- Name: ptyinv_pty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ptyinv_pty ON party_invitation USING btree (party_id_from);


--
-- Name: ptyinv_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ptyinv_stts ON party_invitation USING btree (status_id);


--
-- Name: party_invitation ptyinv_pty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_invitation
    ADD CONSTRAINT ptyinv_pty FOREIGN KEY (party_id_from) REFERENCES party(party_id);


--
-- Name: party_invitation ptyinv_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_invitation
    ADD CONSTRAINT ptyinv_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

