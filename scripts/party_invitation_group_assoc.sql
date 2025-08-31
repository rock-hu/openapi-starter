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
-- Name: party_invitation_group_assoc; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_invitation_group_assoc (
    party_invitation_id character varying(20) NOT NULL,
    party_id_to character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_invitation_group_assoc OWNER TO ofbiz;

--
-- Name: party_invitation_group_assoc pk_party_invitation_group_asso; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_invitation_group_assoc
    ADD CONSTRAINT pk_party_invitation_group_asso PRIMARY KEY (party_invitation_id, party_id_to);


--
-- Name: prt_inn_grp_asc_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_inn_grp_asc_tp ON party_invitation_group_assoc USING btree (last_updated_tx_stamp);


--
-- Name: prt_inn_grp_asc_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_inn_grp_asc_ts ON party_invitation_group_assoc USING btree (created_tx_stamp);


--
-- Name: ptyinvga_ptygrp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ptyinvga_ptygrp ON party_invitation_group_assoc USING btree (party_id_to);


--
-- Name: ptyinvga_ptyinv; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ptyinvga_ptyinv ON party_invitation_group_assoc USING btree (party_invitation_id);


--
-- Name: ptyinvga_ptyto; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ptyinvga_ptyto ON party_invitation_group_assoc USING btree (party_id_to);


--
-- Name: party_invitation_group_assoc ptyinvga_ptygrp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_invitation_group_assoc
    ADD CONSTRAINT ptyinvga_ptygrp FOREIGN KEY (party_id_to) REFERENCES party_group(party_id);


--
-- Name: party_invitation_group_assoc ptyinvga_ptyinv; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_invitation_group_assoc
    ADD CONSTRAINT ptyinvga_ptyinv FOREIGN KEY (party_invitation_id) REFERENCES party_invitation(party_invitation_id);


--
-- Name: party_invitation_group_assoc ptyinvga_ptyto; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_invitation_group_assoc
    ADD CONSTRAINT ptyinvga_ptyto FOREIGN KEY (party_id_to) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

