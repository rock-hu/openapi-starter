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
-- Name: party_relationship; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_relationship (
    party_id_from character varying(20) NOT NULL,
    party_id_to character varying(20) NOT NULL,
    role_type_id_from character varying(20) NOT NULL,
    role_type_id_to character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    status_id character varying(20),
    relationship_name character varying(100),
    security_group_id character varying(20),
    priority_type_id character varying(20),
    party_relationship_type_id character varying(20),
    permissions_enum_id character varying(20),
    position_title character varying(100),
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_relationship OWNER TO ofbiz;

--
-- Name: party_relationship pk_party_relationship; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_relationship
    ADD CONSTRAINT pk_party_relationship PRIMARY KEY (party_id_from, party_id_to, role_type_id_from, role_type_id_to, from_date);


--
-- Name: party_rel_fprole; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_rel_fprole ON party_relationship USING btree (party_id_from, role_type_id_from);


--
-- Name: party_rel_prtyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_rel_prtyp ON party_relationship USING btree (priority_type_id);


--
-- Name: party_rel_secgrp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_rel_secgrp ON party_relationship USING btree (security_group_id);


--
-- Name: party_rel_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_rel_stts ON party_relationship USING btree (status_id);


--
-- Name: party_rel_tprole; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_rel_tprole ON party_relationship USING btree (party_id_to, role_type_id_to);


--
-- Name: party_rel_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_rel_type ON party_relationship USING btree (party_relationship_type_id);


--
-- Name: prt_rltnshp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_rltnshp_txcrts ON party_relationship USING btree (created_tx_stamp);


--
-- Name: prt_rltnshp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_rltnshp_txstmp ON party_relationship USING btree (last_updated_tx_stamp);


--
-- Name: party_relationship party_rel_fprole; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_relationship
    ADD CONSTRAINT party_rel_fprole FOREIGN KEY (party_id_from, role_type_id_from) REFERENCES party_role(party_id, role_type_id);


--
-- Name: party_relationship party_rel_prtyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_relationship
    ADD CONSTRAINT party_rel_prtyp FOREIGN KEY (priority_type_id) REFERENCES priority_type(priority_type_id);


--
-- Name: party_relationship party_rel_secgrp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_relationship
    ADD CONSTRAINT party_rel_secgrp FOREIGN KEY (security_group_id) REFERENCES security_group(group_id);


--
-- Name: party_relationship party_rel_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_relationship
    ADD CONSTRAINT party_rel_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: party_relationship party_rel_tprole; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_relationship
    ADD CONSTRAINT party_rel_tprole FOREIGN KEY (party_id_to, role_type_id_to) REFERENCES party_role(party_id, role_type_id);


--
-- Name: party_relationship party_rel_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_relationship
    ADD CONSTRAINT party_rel_type FOREIGN KEY (party_relationship_type_id) REFERENCES party_relationship_type(party_relationship_type_id);


--
-- PostgreSQL database dump complete
--

