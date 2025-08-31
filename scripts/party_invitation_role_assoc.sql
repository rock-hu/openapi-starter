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
-- Name: party_invitation_role_assoc; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_invitation_role_assoc (
    party_invitation_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_invitation_role_assoc OWNER TO ofbiz;

--
-- Name: party_invitation_role_assoc pk_party_invitation_role_assoc; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_invitation_role_assoc
    ADD CONSTRAINT pk_party_invitation_role_assoc PRIMARY KEY (party_invitation_id, role_type_id);


--
-- Name: prt_inn_rl_asc_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_inn_rl_asc_txp ON party_invitation_role_assoc USING btree (last_updated_tx_stamp);


--
-- Name: prt_inn_rl_asc_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_inn_rl_asc_txs ON party_invitation_role_assoc USING btree (created_tx_stamp);


--
-- Name: ptyinvrole_ptyinv; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ptyinvrole_ptyinv ON party_invitation_role_assoc USING btree (party_invitation_id);


--
-- Name: ptyinvrole_rolet; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ptyinvrole_rolet ON party_invitation_role_assoc USING btree (role_type_id);


--
-- Name: party_invitation_role_assoc ptyinvrole_ptyinv; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_invitation_role_assoc
    ADD CONSTRAINT ptyinvrole_ptyinv FOREIGN KEY (party_invitation_id) REFERENCES party_invitation(party_invitation_id);


--
-- Name: party_invitation_role_assoc ptyinvrole_rolet; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_invitation_role_assoc
    ADD CONSTRAINT ptyinvrole_rolet FOREIGN KEY (role_type_id) REFERENCES role_type(role_type_id);


--
-- PostgreSQL database dump complete
--

