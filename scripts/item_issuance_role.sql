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
-- Name: item_issuance_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE item_issuance_role (
    item_issuance_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.item_issuance_role OWNER TO ofbiz;

--
-- Name: item_issuance_role pk_item_issuance_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY item_issuance_role
    ADD CONSTRAINT pk_item_issuance_role PRIMARY KEY (item_issuance_id, party_id, role_type_id);


--
-- Name: item_issrl_itmis; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX item_issrl_itmis ON item_issuance_role USING btree (item_issuance_id);


--
-- Name: item_issrl_ptrl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX item_issrl_ptrl ON item_issuance_role USING btree (party_id, role_type_id);


--
-- Name: item_issrl_pty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX item_issrl_pty ON item_issuance_role USING btree (party_id);


--
-- Name: itm_issc_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX itm_issc_rl_txcrts ON item_issuance_role USING btree (created_tx_stamp);


--
-- Name: itm_issc_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX itm_issc_rl_txstmp ON item_issuance_role USING btree (last_updated_tx_stamp);


--
-- Name: item_issuance_role item_issrl_itmis; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY item_issuance_role
    ADD CONSTRAINT item_issrl_itmis FOREIGN KEY (item_issuance_id) REFERENCES item_issuance(item_issuance_id);


--
-- Name: item_issuance_role item_issrl_ptrl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY item_issuance_role
    ADD CONSTRAINT item_issrl_ptrl FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: item_issuance_role item_issrl_pty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY item_issuance_role
    ADD CONSTRAINT item_issrl_pty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

